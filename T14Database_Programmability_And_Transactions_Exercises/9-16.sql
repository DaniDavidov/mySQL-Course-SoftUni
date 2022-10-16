DELIMITER %%
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(`number` INT)
BEGIN
SELECT ah.first_name, ah.last_name FROM account_holders AS ah
JOIN accounts AS a ON a.account_holder_id = ah.id
GROUP BY ah.id
HAVING SUM(a.balance) > `number`
ORDER BY ah.id;
END
%%
DELIMITER ;

---------------------------------------------------------

DELIMITER %%
CREATE FUNCTION ufn_calculate_future_value(`sum` DECIMAL(19, 4), `yearly_interest_rate` DOUBLE, `number_of_years` INT)
RETURNS DECIMAL(19, 4)
DETERMINISTIC
BEGIN
RETURN (SELECT sum * (POWER(1 + yearly_interest_rate, number_of_years)));
END
%%
DELIMITER ;

---------------------------------------------------------

DELIMITER %%
CREATE PROCEDURE usp_calculate_future_value_for_account(id INT, interest_rate DOUBLE)
BEGIN 
	SELECT a.id, ah.first_name, ah.last_name, a.balance AS 'current_balance', ufn_calculate_future_value(a.balance, interest_rate, 5) AS balance_in_5_years
    FROM `account_holders` AS ah
    JOIN `accounts` AS a ON a.account_holder_id = ah.id
    WHERE a.id = id;
END
%%
DELIMITER ;

---------------------------------------------------------

DELIMITER %%
CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(19, 4))
BEGIN
	START TRANSACTION;
    IF (money_amount <= 0) 
    THEN ROLLBACK;
    ELSE 
		UPDATE accounts
        SET balance = balance + money_amount
        WHERE id = account_id;
        COMMIT;
	END IF;
END
%%
DELIMITER ;

---------------------------------------------------------

DELIMITER %%
CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19, 4))
BEGIN 
	START TRANSACTION;
    IF (money_amount <= 0 OR (SELECT balance FROM accounts WHERE id = account_id) < money_amount)
    THEN ROLLBACK;
    ELSE 
		UPDATE accounts
        SET balance = balance - money_amount
        WHERE id = account_id;
        COMMIT;
	END IF;
END
%%

--------------------------------------------------------

DELIMITER ;
CREATE TABLE `logs`(
	`log_id` INT PRIMARY KEY AUTO_INCREMENT,
    `account_id` INT NOT NULL,
    `old_sum` DECIMAL(19, 4) NOT NULL,
    `new_sum` DECIMAL(19, 4) NOT NULL
);

DELIMITER %%
CREATE TRIGGER tr_updated_balance
AFTER UPDATE
ON accounts
FOR EACH ROW
BEGIN
	INSERT INTO `logs` (account_id, old_sum, new_sum)
				VALUES (OLD.id, OLD.balance, NEW.balance);
END
%%

--------------------------------------------------------

DELIMITER ;
CREATE TABLE `notification_emails`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `recipient` INT NOT NULL,
    `subject` TEXT NOT NULL,
    `body` TEXT
);

DELIMITER %%
CREATE TRIGGER tr_notification_emails
AFTER UPDATE
ON `logs`
FOR EACH ROW
BEGIN 
	INSERT INTO notification_emails (`recipient`, `subject`, `body`)
							 VALUES (OLD.account_id, CONCAT('Balance change for account:', ' ', OLD.account_id), concat_ws(' ', 'On', NOW(), 'your balance was changed from', OLD.old_sum, 'to', OLD.new_sum, '.'));
END
%%