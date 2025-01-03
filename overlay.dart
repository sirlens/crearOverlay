  bool _isDialogVisible = false;
  OverlayEntry? _overlayEntry;

  void _showDialog(BuildContext context) {
    if (_isDialogVisible) return;

    final RenderBox? renderBox = _iconKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Size size = renderBox.size;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final derecha = position.dx - size.width - 20;
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _hideDialog,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                left: derecha,
                top: position.dy - size.height - 16,
                child: GestureDetector(
                  onTap: _hideDialog,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            children: [
                              Text(
                                "* Descuento por condicion de pago 5%",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "* Descuento por volumen de compra 3%",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: derecha + 6),
                          CustomPaint(
                            size: const Size(15, 10),
                            painter: ArrowPainter(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _isDialogVisible = true;
  }

  void _hideDialog() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isDialogVisible = false;
    }
  }