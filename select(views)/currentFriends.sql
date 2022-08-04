--it shows the 9 most recent friends of the account with id 1

CREATE VIEW current_friends AS
    SELECT friend.first_name, friend.last_name, friend.nickname, friend.profile_pic, friendship_birthday 
        FROM send_invite 
        INNER JOIN account AS friend
            ON friend.id_account=send_invite.id_account_receiver
        WHERE send_invite.is_accepted = true
            AND send_invite.id_account_sender=1
        UNION 
            SELECT friend.first_name, friend.last_name, friend.nickname, friend.profile_pic, friendship_birthday 
            FROM send_invite 
            INNER JOIN account AS friend
                ON friend.id_account=send_invite.id_account_sender
            WHERE send_invite.is_accepted = true
                AND send_invite.id_account_receiver=1
    ORDER BY friendship_birthday DESC
    LIMIT 9;              