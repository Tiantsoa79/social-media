--This shows conversation between two accounts with id 1 and id 2

CREATE VIEW conversation AS 
    SELECT  sender.first_name AS sender,
            message.message_content,
            receiver.first_name AS receiver,
            message.message_datetime,
            message.seen_datetime
    FROM message
    INNER JOIN account as sender
             ON sender.id_account = message.id_account_sender
    INNER JOIN account as receiver
             ON receiver.id_account = message.id_account_receiver
    WHERE       (message.id_account_sender = 1
                AND message.id_account_receiver = 2)
             OR (message.id_account_sender = 2 
                AND message.id_account_receiver = 1)    
    ORDER BY message.message_datetime DESC;