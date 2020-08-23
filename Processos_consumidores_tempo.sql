SELECT    user_concurrent_program_name --count(*),sum(to_number(fcr.ACTUAL_COMPLETION_DATE-fcr.actual_start_date)/3600)
  FROM 
          apps.fnd_concurrent_requests fcr,
          apps.fnd_concurrent_programs_tl fcp,
          apps.fnd_user fu
  WHERE 
      -- fcp.user_concurrent_program_name like '%&Prog%'
--and fcr.ARGUMENT_TEXT like 'INV%'
       fcr.program_application_id = fcp.application_id 
      AND fcr.concurrent_program_id = fcp.concurrent_program_id 
      AND fcp.LANGUAGE = 'US' 
      AND fcr.actual_start_date > sysdate-1
      and fu.user_id=fcr.requested_by
      --and rownum = 20
 ORDER BY fcr.actual_start_date 
