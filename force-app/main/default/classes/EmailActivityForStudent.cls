global class EmailActivityForStudent implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        try {
            List<String> emailAddresses = email.toAddresses;
            System.debug('emailAddresses: ' + emailAddresses);

            // Get the contacts associated with the email addresses by matching with the standard Email field
            List<Contact> contacts = [SELECT Id, Email FROM Contact WHERE Email IN :email.toAddresses];
            System.debug('contacts: ' + contacts);

            // Prepare EmailMessage and EmailMessageRelation lists
            List<EmailMessage> emailMessages = new List<EmailMessage>();
            Map<Id, Id> emailToContactMap = new Map<Id, Id>();

            // Create EmailMessages for each contact
            for (Contact contact : contacts) {
                EmailMessage emailMessage = new EmailMessage();
                emailMessage.Subject = email.subject != null ? email.subject : 'Email from ' + email.fromAddress;
                emailMessage.TextBody = email.plainTextBody != null ? email.plainTextBody : 'No body content';
                emailMessage.FromAddress = email.fromAddress;
                emailMessage.ToAddress = String.join(emailAddresses, ';');
                emailMessage.Incoming = true;
                emailMessages.add(emailMessage);
            }

            // Insert EmailMessages
            insert emailMessages;
            System.debug('Inserted EmailMessages: ' + emailMessages);

            // Map EmailMessage Ids to Contacts
            for (Integer i = 0; i < emailMessages.size(); i++) {
                emailToContactMap.put(emailMessages[i].Id, contacts[i].Id);
                System.debug('emailToContactMap: ' + emailToContactMap);
            }

            // Create EmailMessageRelations
            List<EmailMessageRelation> emailRelations = new List<EmailMessageRelation>();
            for (EmailMessage emailMessage : emailMessages) {
                EmailMessageRelation emailRelation = new EmailMessageRelation();
                emailRelation.EmailMessageId = emailMessage.Id;
                emailRelation.RelationId = emailToContactMap.get(emailMessage.Id);
                emailRelation.RelationType = 'ToAddress';
                emailRelations.add(emailRelation);
            }

            // Insert EmailMessageRelations
            insert emailRelations;
            System.debug('Inserted EmailMessageRelations: ' + emailRelations);

            // Update EmailMessage status
            List<EmailMessage> updateEmailMessages = new List<EmailMessage>();
            for (EmailMessage emailMessage : emailMessages) {
                EmailMessage updateEmailMessage = new EmailMessage();
                updateEmailMessage.Id = emailMessage.Id;
                updateEmailMessage.Status = '3';  // Update status after setting up relations
                updateEmailMessages.add(updateEmailMessage);
            }

            // Perform bulk update on EmailMessages
            update updateEmailMessages;
            System.debug('Updated EmailMessages status: ' + updateEmailMessages);

            // Handle text and binary attachments in a similar way
            if(email.textAttachments != null && email.textAttachments.size() > 0){
                handleTextAttachments(email.textAttachments, emailMessages, result);}

            if(email.binaryAttachments != null && email.binaryAttachments.size() > 0){
                handleBinaryAttachments(email.binaryAttachments, emailMessages, result);}
            
        } catch (Exception e) {
            System.debug('Error processing inbound email: ' + e.getMessage());
            result.success = false;
            result.message = 'Error processing email: ' + e.getMessage();
        }
        
        return result;
    }

    // Handle Text Attachments
    private void handleTextAttachments(List<Messaging.InboundEmail.TextAttachment> textAttachments, List<EmailMessage> emailMessages, Messaging.InboundEmailResult result) {
        if (textAttachments != null && !textAttachments.isEmpty()) {
            for (Messaging.InboundEmail.TextAttachment attachment : textAttachments) {
                try {
                    // Create ContentVersion for each text attachment
                    for (EmailMessage emailMessage : emailMessages) {
                        ContentVersion contentVersion = new ContentVersion();
                        contentVersion.Title = attachment.fileName;
                        contentVersion.PathOnClient = attachment.fileName;
                        contentVersion.VersionData = blob.valueOf(attachment.body);  // The body is a Blob type
                        contentVersion.IsMajorVersion = true;
                        insert contentVersion;

                        // Link ContentDocument to EmailMessage
                        if (contentVersion.Id != null) {
                            ContentDocumentLink contentDocumentLink = new ContentDocumentLink();
                            contentDocumentLink.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :contentVersion.Id].ContentDocumentId;
                            contentDocumentLink.LinkedEntityId = emailMessage.Id; // Link the content to the email message
                            contentDocumentLink.ShareType = 'V'; // Viewer access
                            contentDocumentLink.Visibility = 'AllUsers'; // Visibility to all users
                            insert contentDocumentLink;
                        }
                    }
                    result.success = true;
                } catch (Exception e) {
                    System.debug('Error processing text attachment: ' + e.getMessage());
                }
            }
        } else {
            System.debug('No text attachments found in the email.');
        }
    }

    // Handle Binary Attachments
    private void handleBinaryAttachments(List<Messaging.InboundEmail.BinaryAttachment> binaryAttachments, List<EmailMessage> emailMessages, Messaging.InboundEmailResult result) {
        if (binaryAttachments != null && !binaryAttachments.isEmpty()) {
            for (Messaging.InboundEmail.BinaryAttachment attachment : binaryAttachments) {
                try {
                    // Create ContentVersion for each binary attachment
                    for (EmailMessage emailMessage : emailMessages) {
                        ContentVersion contentVersion = new ContentVersion();
                        contentVersion.Title = attachment.fileName;
                        contentVersion.PathOnClient = attachment.fileName;
                        contentVersion.VersionData = attachment.body;  // The body is a Blob type
                        contentVersion.IsMajorVersion = true;
                        insert contentVersion;

                        // Link ContentDocument to EmailMessage
                        if (contentVersion.Id != null) {
                            ContentDocumentLink contentDocumentLink = new ContentDocumentLink();
                            contentDocumentLink.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :contentVersion.Id].ContentDocumentId;
                            contentDocumentLink.LinkedEntityId = emailMessage.Id; // Link the content to the email message
                            contentDocumentLink.ShareType = 'V'; // Viewer access
                            contentDocumentLink.Visibility = 'AllUsers'; // Visibility to all users
                            insert contentDocumentLink;
                        }
                    }
                    result.success = true;
                } catch (Exception e) {
                    System.debug('Error processing binary attachment: ' + e.getMessage());
                }
            }
        } else {
            System.debug('No binary attachments found in the email.');
        }
    }
}