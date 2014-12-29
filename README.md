# Repro steps

1. Run `make`
2. Open `index.html` in a browser.
3. Open the console.

## Expected:

You should expect to see 2 "hi"s.

## Actual:

You only see one.


## Additional Info

It looks like the interpreter (exampleN) can get spent. I've worked
around this by hiding the interpreter in a monadic bind for each use:
i <- return exampleN should do it.

