/* Verifica os traces ativos dentro de uma base EBS */
SELECT   user_concurrent_program_name, enabled_flag, concurrent_program_name,
         description, restart, enable_trace
    FROM apps.fnd_concurrent_programs_vl
   WHERE queue_control_flag = 'N' AND enable_trace = 'Y'
ORDER BY application_id, user_concurrent_program_name
