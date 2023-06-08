package com.example.userRepository;

import com.example.domain.User;
import com.example.mongoConnection.MongoConnection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import org.bson.Document;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class UserRepository {
    public void addUser(String name, int age, String gender){
            MongoCollection<Document> collection = MongoConnection.getDBCollection();
//            Map<String, Object> documentMap = new HashMap<String, Object>();
//            documentMap.put("name", name);
//            documentMap.put("age",age);
//            documentMap.put("gender",gender);
            collection.insertOne(new Document("name", name)
                                        .append("age",age)
                                        .append("gender",gender)
                                );
        }

    public List<User> findUser(){
        List<User> userList = new ArrayList<>();
        MongoCollection<Document> collection = MongoConnection.getDBCollection();
        MongoCursor<Document> cursor = collection.find().cursor();
        while(cursor.hasNext()){
            Document document = cursor.next();

            String name = (String) document.get("name");
            int age = (int) document.get("age");
            String gender = (String) document.get("gender");

            userList.add(new User(name, age, gender));
            }
        System.out.println(userList);
        return userList;
        }
    }

