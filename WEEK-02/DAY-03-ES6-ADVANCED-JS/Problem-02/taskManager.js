const outputDiv = document.getElementById("output");

/* ===============================
   TASK STORAGE
   =============================== */
let tasks = [];

/* ===============================
   CALLBACK VERSION
   =============================== */
const addTaskCallback = (task, callback) => {
    setTimeout(() => {
        tasks.push(task);
        callback();
    }, 1000);
};

const deleteTaskCallback = (task, callback) => {
    setTimeout(() => {
        tasks = tasks.filter(t => t !== task);
        callback();
    }, 1000);
};

const listTasksCallback = () => {
    outputDiv.innerHTML = `
        <h3>Tasks (Callback)</h3>
        <ul>${tasks.map(t => `<li>${t}</li>`).join("")}</ul>
    `;
};

export const runCallbackVersion = () => {
    tasks = [];
    outputDiv.innerHTML = "Running Callback Version...";

    addTaskCallback("Learn JS", () => {
        addTaskCallback("Learn Async", () => {
            deleteTaskCallback("Learn JS", () => {
                listTasksCallback();
            });
        });
    });
};

/* ===============================
   PROMISE VERSION
   =============================== */
const addTaskPromise = (task) =>
    new Promise(resolve => {
        setTimeout(() => {
            tasks.push(task);
            resolve();
        }, 1000);
    });

const deleteTaskPromise = (task) =>
    new Promise(resolve => {
        setTimeout(() => {
            tasks = tasks.filter(t => t !== task);
            resolve();
        }, 1000);
    });

const listTasksPromise = () => {
    outputDiv.innerHTML = `
        <h3>Tasks (Promise)</h3>
        <ul>${tasks.map(t => `<li>${t}</li>`).join("")}</ul>
    `;
};

export const runPromiseVersion = () => {
    tasks = [];
    outputDiv.innerHTML = "Running Promise Version...";

    addTaskPromise("Learn JS")
        .then(() => addTaskPromise("Learn Async"))
        .then(() => deleteTaskPromise("Learn JS"))
        .then(() => listTasksPromise());
};

/* ===============================
   ASYNC / AWAIT VERSION
   =============================== */
const addTaskAsync = (task) =>
    new Promise(resolve => {
        setTimeout(() => {
            tasks.push(task);
            resolve();
        }, 1000);
    });

const deleteTaskAsync = (task) =>
    new Promise(resolve => {
        setTimeout(() => {
            tasks = tasks.filter(t => t !== task);
            resolve();
        }, 1000);
    });

const listTasksAsync = () => {
    outputDiv.innerHTML = `
        <h3>Tasks (Async/Await)</h3>
        <ul>${tasks.map(t => `<li>${t}</li>`).join("")}</ul>
    `;
};

export const runAsyncAwaitVersion = async () => {
    tasks = [];
    outputDiv.innerHTML = "Running Async/Await Version...";

    await addTaskAsync("Learn JS");
    await addTaskAsync("Learn Async");
    await deleteTaskAsync("Learn JS");
    listTasksAsync();
};