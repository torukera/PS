function slide1()
scheduleEvent(function() promocaoPanel:getChildById("SlideBackground"):setImageSource('images/promocao/slide/background/background1')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("textwindow"):setImageSource('images/promocao/slide/texto/text1')end, 1)

scheduleEvent(function() promocaoPanel:getChildById("SlotBox"):setImageSource('images/promocao/slide/slotbox')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("SlotItem"):setImageSource('images/promocao/slide/item/slot1')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy"):show()end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy").onClick = function() BuzzBox() end end, 1)

scheduleEvent(function() promocaoPanel:getChildById("BallSlide1"):setImageSource('images/promocao/slide/lightball')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide2"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide3"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide4"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide5"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide6"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)

removeEvent(myLoopEventId2)
removeEvent(myLoopEventId3)
removeEvent(myLoopEventId4)
removeEvent(myLoopEventId5)
removeEvent(myLoopEventId6)
myLoopEventId1 = scheduleEvent(slide2, 15000)
end
function slide2()
scheduleEvent(function() promocaoPanel:getChildById("SlideBackground"):setImageSource('images/promocao/slide/background/background2')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("textwindow"):setImageSource('images/promocao/slide/texto/text2')end, 1)

scheduleEvent(function() promocaoPanel:getChildById("SlotBox"):setImageSource('images/promocao/slide/slotbox')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("SlotItem"):setImageSource('images/promocao/slide/item/slot2')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy"):show()end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy").onClick = function() BuzzBox() end end, 1)

scheduleEvent(function() promocaoPanel:getChildById("BallSlide1"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide2"):setImageSource('images/promocao/slide/lightball')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide3"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide4"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide5"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide6"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)

removeEvent(myLoopEventId1)
removeEvent(myLoopEventId3)
removeEvent(myLoopEventId4)
removeEvent(myLoopEventId5)
removeEvent(myLoopEventId6)
myLoopEventId2 = scheduleEvent(slide3, 15000)
end
function slide3()
scheduleEvent(function() promocaoPanel:getChildById("SlideBackground"):setImageSource('images/promocao/slide/background/background3')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("textwindow"):setImageSource('images/promocao/slide/texto/text3')end, 1)

scheduleEvent(function() promocaoPanel:getChildById("SlotBox"):setImageSource('images/promocao/slide/slotbox')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("SlotItem"):setImageSource('images/promocao/slide/item/slot3')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy"):show()end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy").onClick = function() BuzzBox() end end, 1)

scheduleEvent(function() promocaoPanel:getChildById("BallSlide1"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide2"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide3"):setImageSource('images/promocao/slide/lightball')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide4"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide5"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide6"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)

removeEvent(myLoopEventId1)
removeEvent(myLoopEventId2)
removeEvent(myLoopEventId4)
removeEvent(myLoopEventId5)
removeEvent(myLoopEventId6)
myLoopEventId3 = scheduleEvent(slide4, 15000)
end
function slide4()
scheduleEvent(function() promocaoPanel:getChildById("SlideBackground"):setImageSource('images/promocao/slide/background/background4')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("textwindow"):setImageSource('images/promocao/slide/texto/text4')end, 1)

scheduleEvent(function() promocaoPanel:getChildById("SlotBox"):setImageSource('images/promocao/slide/slotbox')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("SlotItem"):setImageSource('images/promocao/slide/item/slot4')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy"):show()end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy").onClick = function() BuzzBox() end end, 1)

scheduleEvent(function() promocaoPanel:getChildById("BallSlide1"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide2"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide3"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide4"):setImageSource('images/promocao/slide/lightball')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide5"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide6"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)

removeEvent(myLoopEventId1)
removeEvent(myLoopEventId2)
removeEvent(myLoopEventId3)
removeEvent(myLoopEventId5)
removeEvent(myLoopEventId6)
myLoopEventId4 = scheduleEvent(slide5, 15000)
end
function slide5()
scheduleEvent(function() promocaoPanel:getChildById("SlideBackground"):setImageSource('images/promocao/slide/background/background5')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("textwindow"):setImageSource('images/promocao/slide/texto/text5')end, 1)

scheduleEvent(function() promocaoPanel:getChildById("SlotBox"):setImageSource('images/promocao/slide/slotbox')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("SlotItem"):setImageSource('images/promocao/slide/item/slot5')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy"):show()end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy").onClick = function() BuzzBox() end end, 1)

scheduleEvent(function() promocaoPanel:getChildById("BallSlide1"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide2"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide3"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide4"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide5"):setImageSource('images/promocao/slide/lightball')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide6"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)

removeEvent(myLoopEventId1)
removeEvent(myLoopEventId2)
removeEvent(myLoopEventId3)
removeEvent(myLoopEventId4)
removeEvent(myLoopEventId6)
myLoopEventId5 = scheduleEvent(slide6, 15000)
end
function slide6()
scheduleEvent(function() promocaoPanel:getChildById("SlideBackground"):setImageSource('images/promocao/slide/background/background6')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("textwindow"):setImageSource('images/promocao/slide/texto/text6')end, 1)

scheduleEvent(function() promocaoPanel:getChildById("SlotBox"):setImageSource('images/promocao/slide/slotbox')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("SlotItem"):setImageSource('images/promocao/slide/item/slot6')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy"):show()end, 1)
scheduleEvent(function() promocaoPanel:getChildById("ButtonBuy").onClick = function() BuzzBox() end end, 1)

scheduleEvent(function() promocaoPanel:getChildById("BallSlide1"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide2"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide3"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide4"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide5"):setImageSource('images/promocao/slide/lightball_opacity')end, 1)
scheduleEvent(function() promocaoPanel:getChildById("BallSlide6"):setImageSource('images/promocao/slide/lightball')end, 1)

removeEvent(myLoopEventId1)
removeEvent(myLoopEventId2)
removeEvent(myLoopEventId3)
removeEvent(myLoopEventId4)
removeEvent(myLoopEventId5)
myLoopEventId6 = scheduleEvent(slide1, 15000)
end


function closeslide()
  removeEvent(myLoopEventId1)
  removeEvent(myLoopEventId2)
  removeEvent(myLoopEventId3)
  removeEvent(myLoopEventId4)
  removeEvent(myLoopEventId5)
  removeEvent(myLoopEventId6)
end