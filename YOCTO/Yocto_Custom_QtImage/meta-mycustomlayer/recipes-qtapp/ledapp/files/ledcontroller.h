#ifndef LEDCONTROLLER_H
#define LEDCONTROLLER_H

#include <QObject>
#include <gpiod.hpp>
#include <QDebug>

class LedController : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool ledState READ ledState WRITE setLedState NOTIFY ledStateChanged)

public:
    explicit LedController(QObject *parent = nullptr) : QObject(parent), chip("gpiochip0"), line(chip.get_line(17)) {
        try {
            line.request({"qt-led", gpiod::line_request::DIRECTION_OUTPUT, 0}, 0);
            qDebug() << "GPIO17 requested successfully";
        } catch (const std::exception &e) {
            qDebug() << "Failed to request GPIO17:" << e.what();
        }
    }

    bool ledState() const {
        try {
            return line.get_value();
        } catch (const std::exception &e) {
            qDebug() << "Failed to get GPIO17 value:" << e.what();
            return false;
        }
    }

public slots:  // Expose setLedState as a slot for QML
    void setLedState(bool state) {
        try {
            line.set_value(state ? 1 : 0);
            qDebug() << "Set GPIO17 to" << (state ? "ON" : "OFF");
            emit ledStateChanged();
        } catch (const std::exception &e) {
            qDebug() << "Failed to set GPIO17:" << e.what();
        }
    }

signals:
    void ledStateChanged();

private:
    gpiod::chip chip;
    gpiod::line line;
};

#endif // LEDCONTROLLER_H