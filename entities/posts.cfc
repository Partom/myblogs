component persistent="true" table="posts"{
	property name="id" column="id" fieldtype="id" generator="increment";
	property name="title" ormtype="text";     
	property name="summary" ormtype="text";
	property name="body" ormtype="text";
	property name="dateposted" ormtype="timestamp";
	property name="createdDateTime" ormtype="timestamp"; 
	property name="modifiedDateTime" ormtype="timestamp"; 
	property name="deleted" ormtype="boolean";
	property name="user" fieldtype="many-to-one" cfc="users";      
	
}