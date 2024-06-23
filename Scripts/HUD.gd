extends CanvasLayer

var coinscoillected = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$CoinCount.text = "coins: " + str(coinscoillected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_coin_3_body_entered(body):
	coinscoillected = coinscoillected + 1
	$CoinCount.text = "coins: " + str(coinscoillected)
