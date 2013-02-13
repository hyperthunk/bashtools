# Release Names:

Scheme is `<release><machine-word-size>-[BuildConfig]`, where `BuildConfig` is

    <emulator-word-size><hipe><smp><epoll>[<compiler>]

And the scheme for these (where `x` always means disabled) is....

    emulator-word-size: L (long) or X (short)
    hipe:               H or x
    smp:                S or x
    epoll:              E or x
    compiler:           G(cc) or L(lvm) or none

Alt scheme (where hipe, smp and epoll support are assumed) is .....

    compiler:           g(cc) or l(lvm)
    word size:          32 or 64
    emulator-word-size: l(ong) or s(hort) or none (for 32bit builds)

NB: No build will be produced without `--enable-threads` ever.
