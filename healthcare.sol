// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract HealthCare {

    uint  private patientsCount = 0;
    Patient[] internal patients;

    struct Patient {
        address patientsAddress;
        string  firstName;
        string secondName;
        uint userId;
    } 
    //to add patients details
    function addDetail(address patientsAddress, string memory firstName, string memory secondName, uint userId)  public {
        patients.push(Patient(patientsAddress, firstName, secondName, userId));
        patientsCount += 1;
    }
    //to display patients 
    function getPatientDetails(uint index) view public returns (address, string memory, string memory, uint) {
        return (patients[index].patientsAddress, patients[index].firstName, patients[index].secondName, patients[index].userId);
    }
    //to remove patient in case of error
   function removePatient(uint index) public {
    require(index < patients.length, "Invalid index");
    for (uint i = index; i < patients.length - 1; i++) {
        patients[i] = patients[i + 1];
    }
    patients.pop();
    patientsCount--;
}
//to update patient details 
function updatePatientDetails(uint index, string memory firstName, string memory secondName, uint userId) public {
    require(index < patients.length, "Invalid index");
    patients[index].firstName = firstName;
    patients[index].secondName = secondName;
    patients[index].userId = userId;
}
//to count the number of patients
function getPatientsCount() view public returns (uint) {
    return patients.length;
}

}


