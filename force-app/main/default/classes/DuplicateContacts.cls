public class DuplicateContacts {
  public static void DuplicateContactCheck(List<Contact> conlist) {
    Map<string, Contact> checkemail = new Map<string, Contact>();
    Map<string, Contact> checkphone = new Map<string, Contact>();

    for (Contact con : conlist) {
      if (Trigger.isInsert) {
        checkemail.put(con.Email, con);
        checkphone.put(con.Phone, con);
      }
      system.debug('isUpdate--' + Trigger.isUpdate);
      system.debug('oldMap--' + Trigger.oldMap);
      /*if (Trigger.isUpdate) {
        if (Trigger.oldMap.get(con.Id).Email != con.Email) {
          checkemail.Put(con.Email, con);
        }
        if (Trigger.oldMap.get(con.Id).Phone != con.Phone) {
          checkphone.Put(con.Phone, con);
        }
      }*/
    }

    string errorMessage = '';

    List<Contact> existinglist = [
      SELECT id, email, phone
      FROM Contact
      WHERE Email IN :checkemail.keyset() OR Phone IN :checkPhone.keyset()
    ];
    if (existinglist.size() > 0) {
      for (Contact crec : existinglist) {
        if (crec.email != null) {
          if (checkemail.get(crec.email) != null) {
            errorMessage = 'Email';
          }
        }
        if (crec.Phone != null) {
          if (checkphone.get(crec.Phone) != null) {
            errorMessage =
              errorMessage + (errorMessage != '' ? 'and Phone ' : 'Phone ');
          }
        }
      }
      if (errorMessage != '') {
        Trigger.new[0]
          .addError('Your Contact ' + errorMessage + ' already exists');
      }
    }
  }
}