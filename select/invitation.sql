select receiver.first_name 
from send_invite 
inner join account as receiver 
     on receiver.id_account=send_invite.id_account_receiver
where send_invite.is_accepted = false 
     and send_invite.id_account_sender=1;