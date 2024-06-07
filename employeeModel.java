/*
This file contains an employee class hierarchy that is used to store information about employees.
*/
-- import the libraries needed for the class, including the exception library, the regular expression library, and the scanner library
import java.util.regex.*;
import java.util.Scanner;
import java.util.InputMismatchException;

/*
create an abstract java class 'Employee' with the following private fields:
- id (auto generated)
- name (string)
- phone (string
and public overridable method:
- getPay => double
- getPhone => string
- getName => string
- getId => int
- setPhone => void
validations:
- use a regular expression to validate the phone number
errors:
- throw an exception if the phone number is invalid
*/

//abstract class  'Employee'
abstract class Employee {
    // private fields
    private int id;
    private String name;
    private String phone;

    // constructor
    public Employee(String name, String phone) {
        this.id = 0;
        this.name = name;
        this.phone = phone;
    }

    // abstract method
    public abstract double getPay();

    // get method for phone
    public String getPhone() {
        return phone;
    }

    // get method for name
    public String getName() {
        return name;
    }

    // get method for id
    public int getId() {
        return id;
    }

    // set method for phone
    public void setPhone(String phone) {
        // regular expression to validate the phone number
        Pattern pattern = Pattern.compile("\\d{3}-\\d{3}-\\d{4}");
        Matcher matcher = pattern.matcher(phone);
        if (matcher.matches()) {
            this.phone = phone;
        } else {
            throw new IllegalArgumentException("Invalid phone number");
        }
    }
}

/*
Create a derived concrete class 'HourlyEmployee' with the following private fields:
- hoursWorked (float)
- hourlyRate
and an override for getPay.
Details:
- hours worked <= 40 return hoursWorked * hourlyRate
  return hoursWorked * hourlyRate * 1.5
*/

// create a derived class 'HourlyEmployee' with a constructor that takes in the name, phone, hoursWorked, and hourlyRate
// the parameters should be set to defaul values
class HourlyEmployee extends Employee {
    // private fields
    private float hoursWorked;
    private float hourlyRate;

    // constructor
    public HourlyEmployee(String name, String phone, float hoursWorked, float hourlyRate) {
        super(name, phone);
        this.hoursWorked = hoursWorked;
        this.hourlyRate = hourlyRate;
    }

    // override the getPay method
    @Override
    public double getPay() {
        // if hours worked is less than or equal to 40, return hoursWorked * hourlyRate
        if (hoursWorked <= 40) {
            return hoursWorked * hourlyRate;
        }
        // otherwise, return hoursWorked * hourlyRate * 1.5
        return hoursWorked * hourlyRate * 1.5;
    }
}





