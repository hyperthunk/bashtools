# Release Names:

Scheme is `<release><machine-word-size>-[BuildConfig]`, where `BuildConfig` is
    
    <emulator-word-size><hipe><smp><epoll>

And the scheme for these (where `x` always means disabled) is....

    emulator-word-size: L (long) or S (short)
    hipe:               H or x
    smp:                S or x
    epoll:              E or x

NB: No build will be produced without `--enable-threads` ever.
