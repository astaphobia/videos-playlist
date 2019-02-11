# videos-playlist (vplay)

flutter project with 
 * `Firebase` authentication and also include Google OAuth.
 * `Redux` for state management for easy implementation.
 * `Stack` wrapper for fullpage loader
 # Project Pattern
 ```
 lib
└── src
    ├── components        ➡️ StatelessWidget wrapper
    ├── pages             ➡️ pages | containers that wrapped by StoreConnector
    ├── res               ➡️ static values
    │   └── values
    ├── store 
    │   ├── actions       ➡️ include classes reactive state triggered
    │   ├── middlewares   ➡️ include voids that can call or inject into store as middleware list
    │   ├── models        ➡️ include classes model all is immutable, only can mutate by reducers
    │   └── reducers      ➡️ include reducers for mutate state
    └── utils             ➡️ helpers class 
    main.dart             ➡️ main class wrapped by StoreProvider
test                     ➡️ includes test classes
```
    
 # How To Run
 `flutter run`
 
 ### OnProgress
