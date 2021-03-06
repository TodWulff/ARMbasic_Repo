#ifndef ABRTOS_TASK_SUPPORT
#define ABRTOS_TASK_SUPPORT

#if 1	' MODULE-SPECIFIC LOG-RELATED DEFINES

	#define ABRTOS_MOD		ABRTOS_LOG_MOD_TASKS

	#define	ABRTOS_TASK_INIT_STARTED				0
	#define	ABRTOS_TASK_INIT_COMPLETED				1
	#define	ABRTOS_TASK_CURRENT_SUSPEND_STARTED		2
	#define	ABRTOS_TASK_CURRENT_SUSPEND_COMPLETED	3
	#define	ABRTOS_TASK_CURRENT_WAITSEMA_STARTED	4
	#define	ABRTOS_TASK_CURRENT_WAITSEMA_COMPLETED	5
	#define	ABRTOS_TASK_CURRENT_KILL_STARTED		6
	#define	ABRTOS_TASK_CURRENT_KILL_COMPLETED		7

#endif

#if 1	' MODULE CONFIG DEFINES AND GLOBAL DECLARATIONS


		' DIM ABRTOS_TASK_ACTIVEID AS INTEGER

#endif

SUB ABRTOS_TASK_INITTASKMGMT
		
	#if ABRTOS_OPTION_USE_LOGGING == 1
		ABRTOS_LOG_EVENT(ABRTOS_MOD,ABRTOS_TASK_INIT_STARTED)
	#endif
	
	
		
	#if ABRTOS_OPTION_USE_LOGGING == 1
		ABRTOS_LOG_EVENT(ABRTOS_MOD,ABRTOS_TASK_INIT_COMPLETED)
	#endif
	
ENDSUB

SUB ABRTOS_TASK_STARTINITTASK (START_TASK_ID,START_TASK_PRIO)

ENDSUB

' FUNCTION ABRTOS_TASK_CREATE() AS INTEGER

	' DIM ABRTOS_TASK_CREATE_RETURN_VALUE AS INTEGER


	' RETURN ABRTOS_TASK_CREATE_RETURN_VALUE
	
' ENDFUNCTION

SUB ABRTOS_TASK_CURRENT_SUSPEND
		
	#if ABRTOS_OPTION_USE_LOGGING == 1
		ABRTOS_LOG_EVENT(ABRTOS_MOD,ABRTOS_TASK_CURRENT_SUSPEND_STARTED)
	#endif
	
	
		
	#if ABRTOS_OPTION_USE_LOGGING == 1
		ABRTOS_LOG_EVENT(ABRTOS_MOD,ABRTOS_TASK_CURRENT_SUSPEND_COMPLETED)
	#endif
	
ENDSUB

SUB ABRTOS_TASK_CURRENT_KILL
		
	#if ABRTOS_OPTION_USE_LOGGING == 1
		ABRTOS_LOG_EVENT(ABRTOS_MOD,ABRTOS_TASK_CURRENT_KILL_STARTED)
	#endif
	
	
		
	#if ABRTOS_OPTION_USE_LOGGING == 1
		ABRTOS_LOG_EVENT(ABRTOS_MOD,ABRTOS_TASK_CURRENT_KILL_COMPLETED)
	#endif
	
ENDSUB

SUB ABRTOS_TASK_CURRENT_WAITSEMA
		
	#if ABRTOS_OPTION_USE_LOGGING == 1
		ABRTOS_LOG_EVENT(ABRTOS_MOD,ABRTOS_TASK_CURRENT_WAITSEMA_STARTED)
	#endif
	
	
	
		
	#if ABRTOS_OPTION_USE_LOGGING == 1
		ABRTOS_LOG_EVENT(ABRTOS_MOD,ABRTOS_TASK_CURRENT_WAITSEMA_COMPLETED)
	#endif
	
ENDSUB


#endif
