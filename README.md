#WIP - this project is under development.

## entityExpress-framework

Entity engine in AS3

## ideas:
 - 2 compile argument: debug, release.
 - you can define your entities.
 - you can add your managers. (managers represents entity engine subsistems.)
 - start stop processes.
 - manage tasks in processes.
 - entities are managed as lists.
 - you can create your own listObjects with custom functions. (add, getNext, remove...)
 - you implement interfaces for diferent entety funcitons. 
 - framewor will automaticaly manage entity lists by interfaces.
 - you will be able to inject any interface list in your tasks and managers.
 - build in, optional rewind, stop, replay features. (awersome for debugging)
 
## classes:
- Entity
 - Component
   - custom data objects. (with 2 cempile arguments for value seting)
-  Engine
 -  Process - timer and enterFrame. (start, pause, resume, stop)
    -   Task(add, add, stop, remove)
- Script.
- Manager.
