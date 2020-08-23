select */*,a.application_name "Application Name",
       decode(b.status, 'I', 'Installed', 'S', 'Shared', 'UnInstalled') "Status",
       PATCH_LEVEL "Patch Level",
       a.basepath "Basepath"*/
  from APPS.fnd_application_vl a, APPS.fnd_product_installations b
 where a.application_id = b.application_id
 order by 2, 1

