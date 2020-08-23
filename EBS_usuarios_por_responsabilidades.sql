/* Formatted on 2005/09/12 11:27 (Formatter Plus v4.7.0) */
SELECT DISTINCT b.user_name, b.description, a.start_date, a.end_date,
                c.responsibility_name
           FROM fnd_user_resp_groups a,
                applsys.fnd_user b,
                fnd_responsibility_tl c,
                fnd_application_tl d
          WHERE a.user_id = b.user_id
            AND a.responsibility_id = c.responsibility_id
            AND a.responsibility_application_id = d.application_id
            AND UPPER (c.responsibility_name) like '%ALBRAS PO GESTOR DE COMPRAS - MATERIAIS%'
            AND b.end_date IS NULL
            AND a.end_date IS NULL;
