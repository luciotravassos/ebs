SELECT request_id,
       PROGRAM_SHORT_NAME,
       PROGRAM,
       user_concurrent_program_name,
       ARGUMENT_TEXT,
       ACTUAL_COMPLETION_DATE,
       COMPLETION_TEXT,
       REQUESTED_BY,
       CONTROLLING_MANAGER,
       ENABLED,
       REQUESTED_START_DATE,
       PHASE_CODE,
       HOLD_FLAG,
       STATUS_CODE,
       REQUEST_ID,
       REQUESTOR,
       PRIORITY
  FROM FND_CONC_REQ_SUMMARY_V
 WHERE PHASE_CODE = 'P'
   and (PHASE_CODE = 'P' AND STATUS_CODE IN ('I', 'Q'))
      --   and program_short_name like 'REQIMPORT'
   and user_concurrent_program_name = 'Report Set'
 order by REQUESTED_START_DATE DESC
