require('pg')

class Property

  attr_reader :id
  attr_accessor :address, :value, :num_of_rooms, :year_built, :buy_or_let, :area, :build_type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @value = options['value']
    @num_of_rooms = options['num_of_rooms']
    @year_built = options['year_built']
    @buy_or_let = options['buy_or_let']
    @area = options['area']
    @build_type = options['build_type']
  end

  def Property.delete_all
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM properties"
    db.prepare("delete_all",sql)
    db.exec_prepared("delete_all",[])
    db.close()
  end

  def Property.all()
    db = PG.connect({dbname: 'properties',host: 'localhost'})
    sql = "SELECT * FROM properties"
    db.prepare("all",sql)
    properties = db.exec_prepared("all",[])
    db.close
    return properties.map{|property| Property.new(property)}
  end

  def save()
    db = PG.connect({dbname: 'properties',host: 'localhost'})
    sql = "INSERT INTO properties (address,value,num_of_rooms, year_built,
    buy_or_let,area,build_type) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING id;"

    values = [@address,@value,@num_of_rooms,@year_built,@buy_or_let,@area,
      @build_type]

    db.prepare("save",sql)

    result = db.exec_prepared("save",values)
    @id = result[0]['id'].to_i
    db.close
  end

   def delete
     db = PG.connect({dbname: 'properties', host:'localhost'})
     sql = "DELETE FROM properties WHERE id = $1"
     values = [@id]

     db.prepare("delete",sql)
     db.exec_prepared("delete",values)
     db.close
   end

   def update()
     db = PG.connect({dbname: 'properties', host:'localhost'})
     sql = "UPDATE properties SET (address,value,num_of_rooms,year_built,buy_or_let,
     area,build_type) = ($1,$2,$3,$4,$5,$6,$7) WHERE id = $8"
     values = [@address,@value,@num_of_rooms,@year_built,@buy_or_let,@area,
       @build_type,@id]
    db.prepare("update",sql)
    db.exec_prepared("update",values)
    db.close
  end

  def Property.find_by_id(id)
    db = PG.connect({dbname: 'properties', host:'localhost'})
    sql = "SELECT * FROM properties WHERE id = $1"
    values = [id]
    db.prepare("find",sql)
    property = db.exec_prepared("find",values)
    db.close
    return property.map{|property| Property.new(property)}
  end

  def Property.find_by_address(address)
    db = PG.connect({dbname: 'properties', host:'localhost'})
    sql = "SELECT * FROM properties WHERE address = $1"
    values = [address]
    db.prepare("find",sql)
    property = db.exec_prepared("find",values)
    db.close
    return property.map{|property| Property.new(property)}
  end

end
