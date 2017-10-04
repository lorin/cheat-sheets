cheatsheet do
    title 'flask'
    docset_file_name 'flask'
    keyword 'flask'
    category do
        id 'Basics'
        entry do
            name 'Skeleton'
            notes <<-'END'
            ```python
            from flask import Flask, abort
            from flask.json import jsonify
            from flask_cors import CORS

            app = Flask(__name__)
            CORS(app)

            @app.route("/hello")
            def hello():
                return jsonify({"hello": "world")

            @app.route("/arg/<id>")
            def lookup(id):
                if id == "correct":
                    return jsonify({"present": True})
                else:
                    abort(404)

            if __name__ == "__main__":
                app.debug = True
                app.run(threaded=True)

            ```
            END
        end
        entry do
            name 'Receive a json payload'
            notes <<-'END'
            ```
            from flask import abort, request

            @app.route("/tasks", methods=["POST"])
            def create_task():
                if not request.json:
                    abort(400)
                data = request.json
                return jsonify("foo", data["foo")
            ```
            END
        end
        entry do
            name 'Globals'
            notes <<-'END'
            There's `flask.g`, but it's not intended to keep state across contexts. It's attached to an application context.
            You can create an app context at the top level to set this.

            ```
            with app.app_context():
                g.foo = 'bar'
            ```

            But a new app context is pushed in each request, so you won't be able to access it in a request.

            Instead, just use regular Python globals, keeping in mind that Flask isn't really designed for
            this kind of state.
            END
        end
    end
    category do
        id 'gunicorn'
        entry do
            name 'Start flask with app with gunicorn'
            notes <<-'END'
            Assuming the app is in server.py, this will start it on port 8000

            ```
            gunicorn server:app
            ```
            END
        end
        entry do
            name 'Different port'
            notes <<-'END'
            ```
            gunicorn -b 0.0.0.0:8888 server:app
            ```
            END
        end
    end
end
