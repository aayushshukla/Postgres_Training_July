do
$$
  declare 
    e_state  varchar;
    e_msg   varchar;
	e_details  varchar;
	e_hint  varchar;
    e_context varchar;

  begin 
     create table mytable(sid int);
	  create table mytable(sid int);
  exception when others then
      get stacked diagnostics
	     e_state = returned_sqlstate,
		 e_msg  =  message_text,
		 e_details =pg_exception_detail,
		 e_hint = pg_exception_hint,
		 e_context = pg_exception_context;
		 
	raise notice 'exception stack exception :
	   state : % ,
	   message : %,
	   detail : %,
	   hint : %,
	   context : % ',e_state,e_msg,e_details,e_hint,e_context;
	   
   end;
$$