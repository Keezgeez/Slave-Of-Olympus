extends CanvasLayer

var coinscoillected = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$CoinCountTut.text = ": " + str(coinscoillected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_coin_body_entered(body):
	coinscoillected = coinscoillected + 1
	$CoinCountTut.text = ": " + str (coinscoillected)
