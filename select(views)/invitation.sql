--It shows all pending friend requests that the account with ID 1 has sent

CREATE VIEW show_pending_request AS
      SELECT destinator.first_name, destinator.last_name
      FROM send_invite 
      INNER JOIN account AS destinator 
            ON destinator.id_account=send_invite.id_account_receiver
      WHERE send_invite.is_accepted = false 
            AND send_invite.id_account_sender=1;
