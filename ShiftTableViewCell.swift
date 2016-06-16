//
//  ShiftTableViewCell.swift
//  Where2Help
//
//  Created by Aaron Cruz on 4/7/16.
//  Copyright © 2016 Where2Help. All rights reserved.
//

import UIKit

class ShiftTableViewCell: UITableViewCell {
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!

  var shift: Shift!
  var event: Event!
  var shiftPresenter: ShiftPresenter!

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  func setShift(shift: Shift) {
    self.shift = shift
    self.shiftPresenter = ShiftPresenter(shift: shift)
    updateCellContent()
  }

  private func updateCellContent() {
    countLabel.text = shiftPresenter.volunteersOutOfLabelText()
    timeLabel.text = shiftPresenter.timespanLabelText()
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  deinit {
    print("De-init Shift cell")
    shift = nil
    event = nil
    shiftPresenter = nil
  }
}
