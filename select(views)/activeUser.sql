--This shows the most active contact that the user with id 1 has (including himself)

CREATE VIEW most_active AS
    SELECT first_name AS user_name,
        count(message.message_content)
    FROM message
    INNER JOIN account
        ON account.id_account = message.id_account_sender
    WHERE  message.id_account_sender = 1
        OR message.id_account_receiver = 1
    GROUP BY first_name
    ORDER BY count DESC;