/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class Account {

    private int id;
    private String userName;
    private String passWord;
    private int isAdmin;
    private String email;

    public Account() {
    }

    public Account(int id, String userName, String passWord, int isAdmin) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.isAdmin = isAdmin;
    }

    public Account(int id, String userName, String passWord, int isAdmin, String email) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.isAdmin = isAdmin;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
