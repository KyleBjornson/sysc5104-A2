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

#ifndef __RUSTINCIDENT_H
#define __RUSTINCIDENT_H


#include "atomic.h"     // class Atomic

class RustIncident : public Atomic
{
public:
	RustIncident( const string &name = "RustIncident" );					//Default constructor

	virtual string className() const ;
protected:
	Model &initFunction();
	Model &externalFunction( const ExternalMessage & );
	Model &internalFunction( const InternalMessage & );
	Model &outputFunction( const InternalMessage & );

private:
	Port &incidentRustOut;
	int randomOutput;

};	// class RustIncident

// ** inline ** // 
inline
string RustIncident::className() const
{
	return "RustIncident" ;
}

#endif   //__RUSTINCIDENT_H
