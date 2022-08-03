--Pour un certain compte avec id=1, affiche toutes les invitations non acceptees qu'il a envoye

select destinator.first_name 
from send_invite 
inner join account as destinator 
      on destinator.id_account=send_invite.id_account_receiver
where send_invite.is_accepted = false 
      and send_invite.id_account_sender=1;
