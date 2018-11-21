/*******************************************************************
*
*  DESCRIPTION: Simulator::registerNewAtomics()
*
*  AUTHORS: Kyle Bjornson
*
*  EMAIL: kyle.bjornson@cmail.carleton.ca
*
*  DATE: November 20th, 2018
*
*******************************************************************/

#include "modeladm.h" 
#include "mainsimu.h"
#include "rustIncident.h"


void MainSimulator::registerNewAtomics()
{
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<RustIncident>(), "RustIncident" ) ;

}

