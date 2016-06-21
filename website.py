import sys
import os.path
import subprocess

from flask import Flask, render_template, render_template_string, redirect, url_for
from flask_flatpages import FlatPages
from flask_frozen import Freezer

app = Flask(__name__)
app.config['FLATPAGES_EXTENSION'] = '.md'
pages = FlatPages(app)
freezer = Freezer(app)

@app.route('/')
def index():
    return redirect(url_for('page', path='index.html'))

@app.route('/<path:path>')
def page(path=None):
    if path is None:
        path = 'index'
    path = os.path.splitext(path)[0]
    page = pages.get_or_404(path)
    page.body = render_template_string(page.body)
    return render_template('default.html', page=page)

@app.route('/keys/<string:key>.asc')
def key(key):
    return subprocess.check_output(['gpg', '--export', '--armour', key]), {'Content-Type': 'application/pgp-signature'}

if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1] == "build":
        app.config['ANAYLITICS'] = True
        freezer.freeze()
    else:
        app.run(debug=True)
