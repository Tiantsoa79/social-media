--Pour un certain compte avec id=1, affiche toutes les invitations non acceptees qu'il a envoye

SELECT destinator.first_name 
FROM send_invite 
INNER JOIN account AS destinator 
      ON destinator.id_account=send_invite.id_account_receiver
WHERE send_invite.is_accepted = false 
      AND send_invite.id_account_sender=1;
