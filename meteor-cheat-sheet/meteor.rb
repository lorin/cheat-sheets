cheatsheet do
    title 'meteor'
    docset_file_name 'meteor'
    keyword 'meteor'
    category do
        id 'Basics'
        entry do
            name 'Run'
            notes <<-'END'
            ```
            meteor
            ```
            END
        end
    end
    category do
        id 'Creation'
        entry do
            name 'Initial setup (React)'
            notes <<-'END'
            ```
            meteor create $appname
            cd $appname
            meteor npm install --save react react-dom prop-types react-addons-pure-render-mixin react-router history
            meteor add react-meteor-data
            ```
            END
        end
        entry do
            name 'Directory structure'
            notes <<-'END'
            ```
            ├── client
            │   ├── main.css
            │   ├── main.html
            │   └── main.jsx
            ├── imports
            │   ├── api
            │   │   └── tasks.js
            │   └── ui
            │       ├── App.jsx
            │       └── Task.jsx
            └── server
                └── main.js
            ```

            This is the task example, so imports/api/tasks.js contains the interface to the database,
            and imports/ui/Task.jsx contains the React task component.

            Excludes things like node_modules, package.json
            END
        end
        entry do
            name 'client/main.html'
            notes <<-'END'
            ```
            <head>
              <title>Title goes here</title>
            </head>

            <body>
                <div id="render-target"></div>
            </body>
            ```
            END
        end
        entry do
            name 'client/main.jsx'
            notes <<-'END'
            ```
            import React from 'react';
            import { Meteor } from 'meteor/meteor';
            import { render } from 'react-dom';
             
            import App from '../imports/ui/App.jsx';
             
            Meteor.startup(() => {
              render(<App />, document.getElementById('render-target'));
            });
            ```

            See also the routing section below
            END
        end
        entry do
            name 'imports/ui/App.jsx'
            notes <<-'END'
            ```
            import React, { Component } from 'react';

            export default class App extends Component {
                render() {
                    return (
                        <div className="container">
                            <header>
                                <h1>Header goes here</h1>
                            </header>
                        </div>
                    );
                }
            }
            
            ```
            END
        end
    end
    category do
        id 'Collections (mongo) data access'
        entry do
            name 'Note: import on server side'
            notes <<-'END'
            You must import the collections code on the server side or
            you'll get method not found errors.
            END
        end
        entry do
            name 'imports/api/tasks.js'
            notes <<-'END'
            ```
            import { Mongo } from 'meteor/mongo';
             
            export const Tasks = new Mongo.Collection('tasks');
            ```
            END
        end
        entry do
            name 'server/main.js'
            notes <<-'END'
            ```
            import { Meteor } from 'meteor/meteor';
            import '../imports/api/tasks.js';

            Meteor.startup(() => {
              // code to run on server at startup
            });
            ```
            END
        end
        entry do
            name 'imports/ui/App.jsx with collections'
            notes <<-'END'
            ```
            import React, { Component } from 'react';
            import { createContainer } from 'meteor/react-meteor-data';

            import { Tasks } from '../api/tasks.js';
             
            class App extends Component {
                render() { ... }
            }

            export default createContainer(() => {
                return {
                    tasks: Tasks.find({}).fetch(),
                };
            }, App);
            ```
            END
        end
        entry do
            name 'Retrieving one object'
            notes <<-'END'
            ```javascript
            import React, { Component } from 'react';
            import { Widgets } from '../api/widgets.js';
            import { createContainer } from 'meteor/react-meteor-data';

            class WidgetForm extends Component {
                // ...

                componentWillReceiveProps(nextProps) {
                    if(nextProps.widget) {
                        this.setState(nextProps.widget);
                    }
                }
            }

            export default WidgetFormContainer = createContainer(({ id }) => {
                let widget;
                let widgets = Widgets.find(id).fetch();
                if(widgets.length === 1) {
                    widget = widgets[0];
                }
                return { widget };
            }, WidgetForm);
            
            ```

            Note: This example above sets the state of the component to the data
            retrieved.
            END
        end
        entry do
            name 'Create'
            notes <<-'END'
            ```
            Tasks.insert({
                text,
                createdAt: new Date(), // current time
            });
            
            ```
            END
        end
        entry do
            name 'Sort by creation date'
            notes <<-'END'
            ```
            Tasks.find({}, { sort: { createdAt: -1 } }).fetch()
            ```
            END
        end
        entry do
            name 'Delete'
            notes <<-'END'
            ```
            Tasks.remove(task._id);
            ```
            END
        end
        entry do
            name 'Update'
            notes <<-'END'
            ```
            Tasks.update(task._id, {
              $set: { checked: false },
            });
            ```
            END
        end
    end
    category do
        id 'Routing'
        entry do
            name 'Docs'
            notes <<-'END'
            <https://guide.meteor.com/react.html#using-react-router>
            END
        end
        entry do
            name 'Routing example'
            notes <<-'END'
            ```
            // client/main.jsx
            import { Meteor } from 'meteor/meteor';
            import { render } from 'react-dom';
            import { renderRoutes } from '../imports/startup/client/routes.jsx';

            Meteor.startup(() => {
              render(renderRoutes(), document.getElementById('render-target'));
            });
            ```

            ```
            // imports/startup/client/routes.jsx
            import React from 'react';
            import { Router, Route } from 'react-router';
            import createBrowserHistory from 'history/createBrowserHistory';

            import App from '../../ui/App.jsx'
            import Widgets from '../../ui/Widgets.jsx'

            const browserHistory = createBrowserHistory();

            export const renderRoutes = () => (
                <Router history={browserHistory}>
                    <div>
                        <Route exact path="/" component={App}/>
                        <Route path="/risks" component={Widgets}/>
                    </div>
                </Router>
            );
            ```
            END
        end
    end
    category do
        id 'mongo admin'
        entry do
            name 'mongo console'
            notes <<-'END'
            ```
            meteor mongo
            ```
            END
        end
        entry do
            name 'Name of mongo database'
            notes <<-'END'
            ```
            meteor
            ```
            END
        end
        entry do
            name 'Add to a collection via console'
            notes <<-'END'
            ```
            db.tasks.insert({ text: "Hello world!", createdAt: new Date() });
            ```
            END
        end
        entry do
            name 'Sort collection by name'
            notes <<-'END'
            ```
            let widgets = db.widgets.find({}, {sort: {name: 1}}).fetch();
            ```
            END
        end
        entry do
            name 'Convert a column from string to number'
            notes <<-'END'
            ```
            db.widgets.find({}).forEach((x) => {
                 x.weight = Number(x.weight);
                 db.widgets.save(x);
                });
            ```
            END
        end
        entry do
            name 'port'
            notes <<-'END'
            ```
            $ cat .meteor/local/db/METEOR-PORT
            3001
            ```
            END
        end
        entry do
            name 'Binary'
            notes <<-'END'
            ```
            .meteor/packages/meteor-tool/.1.5.0.edxpxb++os.osx.x86_64+web.browser+web.cordova/mt-os.osx.x86_64/dev_bundle/mongodb/bin/mongod
            ```
            END
        end
        entry do
            name 'Files'
            notes <<-'END'
            ```
            .meteor/local/db
            ```
            END
        end
    end
end
