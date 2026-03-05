
Create Table UsersInfo
( EmailId varchar(100) Primary Key,
  UserName varchar(50) Not Null,
  [Role] varchar(50) Not Null,           ---- use [ ] for variables that appears as keywords(blue color)----
  [Password] varchar(20) Not Null
  );


  INSERT INTO UsersInfo VALUES 
  ('kiran@gmail.com','KiranAdmin','Admin','Kiran@admin123'),
  ('surya@gmail.com','Surya','Participant','surya123');


  Select * from UsersInfo;


Create Table EventDetails
( EventId INT Primary Key,
  EventName varchar(50) Not Null,
  EventCategory varchar(50) Not Null,
  EventDate datetime Not Null,
  Description varchar(200),
  Status  varchar(20)

  );


  INSERT INTO EventDetails VALUES
  (1,'Web Development','Technology','03-03-2026','Tech Event','Active');

  Select * from EventDetails;




Create Table SpeakersDetails
( SpeakerId INT Primary Key Not Null,
  SpeakerName varchar(50) Not Null
 );


 INSERT INTO SpeakersDetails VALUES
(1001,'SuryaKiran'); 


 Select * from SpeakersDetails;




Create Table SessionInfo 
( SessionId INT Primary Key,
  EventId INT Foreign Key REFERENCES EventDetails(EventId) NOT NULL,
  SessionTitle varchar(50) NOT NULL,
  SpeakerId INT Foreign Key REFERENCES SpeakersDetails(SpeakerId) NOT NULL,
  Description varchar(200),
  SessionStart datetime NOT NULL,
  SessionEnd datetime NOT NULL,
  SessionURL varchar(100)
);


 INSERT INTO SessionInfo VALUES
  (1001,1, 'Web Development',1001,
  'Tech',
  '03-03-2026 15:00:30',
  '03-03-2026 15:45:40',
  'www.upgrad.com/session1');



select * from SessionInfo;



Create Table ParticipantEventDetails
( ID INT Primary Key Not Null, 
  ParticipantEmailId varchar(100) Foreign Key REFERENCES UsersInfo(EmailId) Not Null,
  EventId INT Foreign Key  REFERENCES EventDetails(EventId) Not Null,
  SessionId INT Foreign key REFERENCES SessionInfo(SessionId) Not Null,
  isAttended bit
);
  


   INSERT INTO ParticipantEventDetails VALUES
   (1,'surya@gmail.com',1,1001,1);


   select * from ParticipantEventDetails;







