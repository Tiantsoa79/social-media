--afficher tous les amis du compte avec l'id 1

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
        AND send_invite.id_account_receiver=1;      