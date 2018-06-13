component persistent="true" table="users"{
	property name="id" column="id" fieldtype="id" generator="increment";
	property name="name"  ormtype="string";     
	property name="email"  ormtype="text";
	property name="password"  ormtype="text";  
	property name="posts" singularname="post" fieldtype="one-to-many" cfc="posts" fkcolumn="user_id" cascade="all";
	function getName(){
		return uCase(variables.name);
	}

}