select /*+ ALL_ROWS */
       fcqtl.user_concurrent_queue_name "Gerenciador Concorrente",
       fcptl.user_concurrent_program_name "Programa",
       round(sum(greatest(actual_completion_date - actual_start_date,0))*60*24, 2) "Duração Total (mín.)",
       round(avg(greatest(actual_completion_date - actual_start_date,0))*60*24, 2) "Duração Média (mín.)",
       round(min(greatest(actual_completion_date - actual_start_date,0))*60*24, 2) "Duração Mín. (mín.)",
       round(max(greatest(actual_completion_date - actual_start_date,0))*60*24, 2) "Duração Máx. (mín.)",
       count(*) "Vezes Executado"
  from
       fnd_concurrent_programs fcp,
       fnd_concurrent_programs_tl fcptl,
       fnd_concurrent_processes fcproc,
       fnd_concurrent_queues_tl fcqtl,
       fnd_concurrent_queues fcq,
       fnd_concurrent_requests fcr
 where
       fcr.phase_code = 'C'
       and fcr.actual_completion_date is not null
       and actual_start_date is not null
       and fcq.concurrent_queue_id = fcproc.concurrent_queue_id
       and fcq.application_id =fcproc.queue_application_id
       and fcq.manager_type  = 1
       and fcr.controlling_manager  = fcproc.concurrent_process_id
       and fcr.program_application_id =fcp.application_id
       and fcr.concurrent_program_id = fcp.concurrent_program_id
       and fcp.concurrent_program_name not in ('ACTIVATE','ABORT','DEACTIVATE','VERIFY')
       and fcr.concurrent_program_id =fcptl.concurrent_program_id
       and fcr.program_application_id =fcptl.application_id
       and fcptl.language=userenv('LANG')
       and fcproc.queue_application_id = fcqtl.application_id
       and fcproc.concurrent_queue_id = fcqtl.concurrent_queue_id
       and fcqtl.language=userenv('LANG')
       and trunc(actual_start_date) between trunc(to_date('&inicial', 'YYYY-MM-DD')) and trunc(to_date('&final', 'YYYY-MM-DD'))
 group by
       fcqtl.user_concurrent_queue_name,
       fcptl.user_concurrent_program_name
 order by
       "Duração Total (mín.)" desc,
       "Gerenciador Concorrente" asc;

