cheatsheet do
    title 'react'
    docset_file_name 'react'
    keyword 'react'
    category do
        id 'Components'
        entry do
            name 'Basic component'
            notes <<-'END'
            ```jsx
            import React, { Component } from 'react';
            import PropTypes from 'prop-types';

            export default class Widget extends Component {
                render() {
                    return (
                        <div className="container">Hello world</div>
                    );
                }
            }

            Widget.propTypes = {
                gizmos: PropTypes.array.isRequired
            }
            ```

            Note: container class here is a [bootstrap thing](http://getbootstrap.com/css/#overview-container).
            END
        end
        entry do
            name 'Props'
            notes <<-'END'
            Pass like this:

            ```
            <Foo bar="baz"/>
            ```

            Access like this:

            ```
            if(this.props.bar === "baz") { ... }
            ```
            END
        end
        entry do
            name 'Render child properties'
            notes <<-'END'
            ```javascript
            render() {
                return (
                    ...
                    { props.children }
                    ...
                );
            }
            ```
            END
        end
    end
    category do
        id 'Forms'
        entry do
            name 'Simple example (bootstrap form)'
            notes <<-'END'
            ```jsx
            export default class MyForm extends Component {
                constructor(props) {
                    super(props);
                    this.state = {
                        name: '',
                    };

                    this.handleChangeName = this.handleChangeName.bind(this);
                }

                handleChangeName(event) {
                    this.setState({name: event.target.value});
                }
            
                render() {
                    return (
                        <form className="form-horizontal">
                            <div className="form-group">
                                <label htmlFor="name" className="col-sm-2 control-label">Name</label>
                                <div className="col-sm-10">
                                    <input type="text" value={this.state.name} onChange={this.handleChangeName} className="form-control" id="name" />
                                </div>
                            </div>
                            <div className="form-group">
                            // Next field here
                            </div>
                        </form>
                    );
                }
            ```
            END
        end
        entry do
            name 'Simple example with react-bootstrap'
            notes <<-'END'
            ```jsx
            import { ControlLabel, FormControl, FormGroup } from 'react-bootstrap';

            // ...

            <FormGroup controlId="name">
                <ControlLabel>Name</ControlLabel>
                <FormControl value={this.state.name} onChange={this.handleChangeName} />
            </FormGroup>
            
            ```
            END
        end
        entry do
            name 'Button (react-bootstrap)'
            notes <<-'END'
            ```jsx
            handleSave() {
                // ...
            }

            <Button bsStyle="success" onClick={this.handleSave.bind(this)}>Save</Button>
            ```
            END
        end
        entry do
            name 'Focus on a field at start'
            notes <<-'END'
            Add the `autoFocus` attribute (note case), e.g. (react-bootstrap):

            ```
            <FormGroup controlId="name">
                <ControlLabel>Name</ControlLabel>
                <FormControl autoFocus value={this.state.name} onChange={this.handleChangeName} />
            </FormGroup>
            ```

            END
        end
    end
    category do
        id 'Multi-select form'
        entry do
            name 'react-bootstrap'
            notes <<-'END'
            ```jsx
            import {  ControlLabel, FormControl, FormGroup } from 'react-bootstrap';

            ...
            <FormGroup controlId="widgets">
                <ControlLabel>Widgets</ControlLabel>
                <FormControl componentClass="select" multiple size={widgets.length} value={this.state.widgets} onChange={this.handleChangeWidgets}>
                    {widgets}
                </FormControl>
            </FormGroup>
            ```

            For multi-select, pass the `value` attribute an array of values to specify which ones are selected.
            END
        end
        entry do
            name 'Control height / size / number of entries'
            notes <<-'END'
            Set the `size` attribute
            END
        end
        entry do
            name 'Which elements are selected?'
            notes <<-'END'
            ```jsx
            handleChangeWidgets(event) {
                let widgets = Array.prototype.slice.call(event.target.options)
                    .filter(x => x.selected)
                    .map(x => x.value);
                this.setState({widgets});
            }
            ```

            Note that event.target.options is a nodelist, not an array, so
            the example above converts it first to an array by calling slice on it,
            so we can call filter on it.
            END
        end
    end
    category do
        id 'Other'
        entry do
            name 'Handle keyboard events'
            notes <<-'END'
            ```jsx
            export default class MyTable extends Component {
                constructor(props) {
                    super(props);

                    this.state = {active_row: 0};
                }

                componentWillMount() {
                    document.addEventListener("keydown", this.handleKey.bind(this));
                }
                
                componentWillUnmount() {
                    document.removeEventListener("keydown", this.handleKey.bind(this));
                }

                handleKey(event) {
                    switch(event.key) {
                        case 'j':
                            if(this.state.active_row < this.props.widgets.length-1) {
                                this.setState({active_row: this.state.active_row+1});
                            }
                            break;
                        case 'k':
                            if(this.state.active_row > 0) {
                                this.setState({active_row: this.state.active_row-1});
                            }
                            break;
                        case 'Enter':
                            // ... 
                        }
                    }
                }
                        ```
            END
        end
        entry do
            name 'Set the title'
            notes <<-'END'

            Static title

            ```js
            componentDidMount() {
                document.title = "My title";
            }
            ```

            Dynamic title:

            ```js
            componentWillUpdate(nextProps) {
                document.title = nextProps.widget.name;
            }
            ```
            END
        end
    end
    category do
        id 'Router'
        entry do
            name 'Basic example'
            notes <<-'END'
            ```jsx
            import React from 'react';
            import { Router, Route, Switch } from 'react-router';
            import createBrowserHistory from 'history/createBrowserHistory';

            import App from '../../ui/App.jsx'
            import NotFound from '../../ui/NotFound.jsx'
            import Widgets from '../../ui/Widgets.jsx'
            import WidgetForm from '../../ui/WidgetForm.jsx'

            const browserHistory = createBrowserHistory();

            export const renderRoutes = () => (
                <Router history={browserHistory}>
                    <Switch>
                        <Route exact path="/" component={App}/>
                        <Route path="/widgets" component={Widgets}/>
                        <Route path="/widgets/:id" component={WidgetFormWrapper}/>
                        <Route component={NotFound} />
                    </Switch>
                </Router>
            );

            const WidgetFormWrapper = ({ match }) => (
                <WidgetForm id={match.params.id}/>
            );
            ```

            When using the router to match query params as args, they get passed
            as `props.match.params.<name>`. I use a wrapper above so that the container
            doesn't need to know about the match.params idiom.

            The Switch component must be used to ensure that only the first match gets
            rendered. Otherwise, every match gets rendered.
            END
        end
        entry do
            name 'query params'
            notes <<-'END'
            There isn't built-in support for query params. react-router passes `location`
            as a prop, and you need to parse it. You can do it like this, using the `querystring` package:

            ```js
            import { parse as parseQueryString } from 'querystring'
            ...
            constructor(props) {
                ...
                super(props);
                    let params = parseQueryString(props.location.search.slice(1)); // remove the '?' with slice
                    let name = params.name;
                    ...
            ```
            END
        end
    end
    category do
        id 'Warnings'
        entry do
            name 'Warning: Input is changing an uncontrolled input'
            notes <<-'END'
            Check if the value you are passing to the input is undefined.
            END
        end
    end
end
