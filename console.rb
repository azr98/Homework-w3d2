require('pry')
require_relative('models/Property.rb')

Property.delete_all

property1 = Property.new({
  'address' => '21 Buccluech street EH8 9JN',
  'value' => 200000,
  'num_of_rooms' => 2,
  'year_built' => 1890,
  'buy_or_let' => 'let',
  'area' => 430,
  'build_type' => 'flat'
  })

property1.save()

binding.pry

nil

#Q1 We are installing Property tracker instances in the console.rb

#Q2 The instance save method of the property class in the sql = statement saves
#properties to the database

#Q3 Propery.delete_all, property1.save modify the databse

#Q4 It is assigned an id by sql because it's id is dependant on the number of rows
#already in the table

#Q5

#Q6 so the id is set to nil instead of 0

#Q7 Some methods like find_by_id should not be run using an exiting instance of
#property. You should be able ot use even when there is no property instances
#without needing to create one which is done with class methods

#Q8 It is returned as an array of hashes. It is accessed in saved using
#array[index]['key'].to_i eg result[0]['id'].to_i

#Q9 to be able to store what is returned and be able ot access only what is needed

#Q10 and id of type int and address of type string

#Q11 An array of a property object
