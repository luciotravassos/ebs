SELECT q.concurrent_queue_name,
       COUNT(*) "Processos Executados",
       SUM(r.actual_completion_date - r.actual_start_date) * 24 * 60 elapsed,
       AVG(r.actual_completion_date - r.actual_start_date) * 24 * 60 average,
       SUM(r.actual_start_date - r.requested_start_date) * 24 * 60 waited,
       AVG(r.actual_start_date - r.requested_start_date) * 24 * 60 avewait
  FROM apps.fnd_concurrent_programs  p,
       apps.fnd_concurrent_requests  r,
       apps.fnd_concurrent_queues    q,
       apps.fnd_concurrent_processes p
 WHERE r.program_application_id = p.application_id
   AND r.concurrent_program_id = p.concurrent_program_id
   AND r.status_code IN ('C', 'C')
   AND r.controlling_manager = p.concurrent_process_id
   AND q.concurrent_queue_id = p.concurrent_queue_id
   AND r.concurrent_program_id = p.concurrent_program_id
   AND r.actual_start_date > sysdate-30
 group by q.concurrent_queue_name;
