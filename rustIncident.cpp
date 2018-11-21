/*******************************************************************
*
*  DESCRIPTION: Atomic Model RustIncident
*
*  AUTHORS: Kyle Bjornson
*
*  EMAIL: kyle.bjornson@cmail.carleton.ca
*
*  DATE: November 20th, 2018
*
*******************************************************************/

/** include files **/
#include "rustIncident.h"      // class RustIncident
#include "message.h"    // class ExternalMessage, InternalMessage
#include "mainsimu.h"   // MainSimulator::Instance().getParameter( ... )
#include "strutil.h"       // str2float( ... )
#include <cstdlib>

#define DEBUG 0

/** public functions **/

/*******************************************************************
* Function Name: RustIncident
********************************************************************/
RustIncident::RustIncident( const string &name )
: Atomic( name )
, incidentRustOut( addOutputPort( "incidentRustOut" ) )
{
}

/*******************************************************************
* Function Name: initFunction
********************************************************************/
Model &RustIncident::initFunction()
{
	randomOutput = rand() % 1000;
	holdIn(active, Time::Zero);
	return *this ;
}

/*******************************************************************
* Function Name: externalFunction
********************************************************************/
Model &RustIncident::externalFunction( const ExternalMessage &msg )
{
	return *this;
}

/*******************************************************************
* Function Name: internalFunction
********************************************************************/
Model &RustIncident::internalFunction( const InternalMessage & ){

	randomOutput = rand() % 1000;
	holdIn(active, Time(0,0,1,0));
	return *this ;
}

/*******************************************************************
* Function Name: outputFunction
********************************************************************/
Model &RustIncident::outputFunction( const InternalMessage &msg ){
	#if DEBUG
		std::cout << "Random: " << randomOutput <<"\n";
	#endif

	if (randomOutput == 500) {
		sendOutput( msg.time(), incidentRustOut, 1);
	}

	return *this ;
}
