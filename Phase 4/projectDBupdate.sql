insert into F23_S001_T5_Students(StudentID, Name, Email, Ratings, Reviews, SubscriptionID) VALUES (56,'Joshua','jua@uta.edu',5,'the suicide squad is awesome',NULL);

insert into F23_S001_T5_Admin (AdminID, Name, Email, AccessKey) VALUES (99, 'Vernon', 'vrvr@svt.org', 'sjdgfhsg');

insert into F23_S001_T5_Media (ContentID, Title, ReleaseDate, Duration, Views, Genre, Language, SeriesID, AdminID, SubscriptionID) VALUES (77, 'Seventeen in the soop.', TO_DATE('2023-11-02', 'YYYY-MM-DD'), 90 , 9999345, 'Comedy', 'Korean', 43, 33, 19);

update F23_S001_T5_SeriesDistributor set Salary = 550000 where SeriesDistributorID = '23';

update F23_S001_T5_Subscription set SubscriptionCost = 50 where SubscriptionID = '3';

delete from F23_S001_T5_Admin where AdminID = 9;

delete from F23_S001_T5_Subscription where SubscriptionID = 50;

delete from F23_S001_T5_Watches where StudentID = 43;



