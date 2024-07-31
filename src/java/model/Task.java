/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Task {

    private String id, title, description,status,accountId, createdAt, finishedAt;

    public Task() {
    }

    public Task(String id, String title, String description, String status, String accountId, String createdAt, String finishedAt) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.status = status;
        this.accountId = accountId;
        this.createdAt = createdAt;
        this.finishedAt = finishedAt;
    }

   
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt.substring(0, 19);
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getFinishedAt() {
        if(finishedAt == null) return "Unfinished";
        return finishedAt;
    }

    public void setFinishedAt(String finishedAt) {
        this.finishedAt = finishedAt;
    }

    @Override
    public String toString() {
        return "Task{" + "id=" + id + ", title=" + title + ", description=" + description + ", status=" + status + ", accountId=" + accountId + ", createdAt=" + createdAt + ", finishedAt=" + finishedAt + '}';
    }
    
}
