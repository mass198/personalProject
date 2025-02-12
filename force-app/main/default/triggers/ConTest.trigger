trigger ConTest on Contact(before insert,before update,after update) {

for(integer i=0; i<30;i++)
{
List<contact> c= [select id from contact where Name = 'test'];
}
   
}