<?php
/**
 * Copyright (C) 2015 Digimedia Sp. z o.o. d/b/a Clearcode
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

namespace SevenTag\Api\TriggerBundle\Validator\Constraints;

use SevenTag\Api\TriggerBundle\TriggerType\Holder\HolderInterface;
use SevenTag\Api\TriggerBundle\TriggerType\Type\TypeInterface;
use SevenTag\Component\Trigger\Model\TriggerInterface;
use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

/**
 * Class TriggerStrategyValidator
 * @package SevenTag\Api\TriggerBundle\Validator\Constraints
 */
class TriggerStrategyValidator extends ConstraintValidator
{
    /**
     * @var HolderInterface
     */
    private $holder;

    /**
     * @param HolderInterface $holder
     */
    public function __construct(HolderInterface $holder)
    {
        $this->holder = $holder;
    }

    /**
     * @param TriggerInterface $trigger
     * @param Constraint $constraint
     */
    public function validate($trigger, Constraint $constraint)
    {
        $type = $trigger->getType();
        if (TypeInterface::TYPE_EVENT === $type) {
            if ($trigger->getConditions()->isEmpty()) {
                $this->context->buildViolation($constraint->messageAtLeastOneConditions)
                    ->setParameter('%type%', 'event')
                    ->addViolation();
            }
        }
    }
}
