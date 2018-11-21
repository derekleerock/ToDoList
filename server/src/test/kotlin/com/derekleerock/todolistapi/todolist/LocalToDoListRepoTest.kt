package com.derekleerock.todolistapi.todolist

import org.hamcrest.CoreMatchers.`is`
import org.hamcrest.CoreMatchers.equalTo
import org.hamcrest.MatcherAssert.assertThat
import org.junit.Test

class LocalToDoListRepoTest {
    @Test
    fun getAll_returnsEmptyList_whenNoItems() {
        val localToDoListRepo = LocalToDoListRepo()


        val toDos = localToDoListRepo.getAll()


        assertThat(toDos.size, `is`(equalTo(0)))
    }

    @Test
    fun create_returnsCreatedItem() {
        val localToDoListRepo = LocalToDoListRepo()


        val toDoItem = localToDoListRepo.create(
                NewToDo("Buy groceries")
        )


        val expectedToDoItem = ToDoItem(1, "Buy groceries", false)
        assertThat(toDoItem, `is`(equalTo(expectedToDoItem)))
    }
}