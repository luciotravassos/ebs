/*Especifica se uma responsabilidade existe ou não*/
SELECT DISTINCT c.responsibility_name,c.creation_date
           FROM applsys.fnd_user_resp_groups a,
                fnd_responsibility_tl c,
                fnd_application_tl d
          WHERE UPPER (c.responsibility_name) like upper('%OEBS%')
            AND a.responsibility_id = c.responsibility_id
            AND a.responsibility_application_id = d.application_id
