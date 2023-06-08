package com.example.mongoConnection;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

public class MongoConnection {
    private static final String ip = "127.0.0.1";
    private static final int port = 27017;
    private static final String db = "db01";
    private static final String collection = "user";

    private static final MongoClient mongoClient = new MongoClient(ip, port);

    public static MongoCollection<Document> getDBCollection() {
        return mongoClient.getDatabase(db).getCollection(collection);
    }

}
